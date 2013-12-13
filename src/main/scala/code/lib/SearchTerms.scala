package code
package lib


import comet._
import net.liftweb.common.{Loggable}
import net.liftweb.http.{SHtml}
import net.liftweb.http.js.{JE}
import net.liftweb.json._
import net.liftweb.util.Helpers._
import org.jboss.netty.util.CharsetUtil
import com.twitter.util.Future


object SearchTerms extends Loggable {


  def search( term: String ): Unit = {

    implicit val formats = DefaultFormats

    val searchTerm = parse("""
                             {
                                 "query": {
                                     "term": {
                                         "name.autocomplete": """" + term + """"
                                     }
                                 },
                                 "facets": {
                                     "name": {
                                         "terms": {
                                             "field": "name"
                                         }
                                     }
                                 }
                             }
                                                                             """)

    val response = ElasticSearch.documentSearch( searchTerm )

    response.onSuccess{res =>
      try {
        val json = parse( res.getContent.toString(CharsetUtil.UTF_8) )
        val results = json.extract[Results]
        val documents:List[String] = results.hits.hits.map {
          document => ( document._source.name )
        }
        InboxActor ! Message(documents)

      } catch {
        case e: JsonParser.ParseException => "Means the string is not valid JSON"
        case m: MappingException => "Means the string is JSON, but doesn't respect the format of Document"
          logger.error(m.getMessage)
      }

      Future.Done
    }.onFailure{
      err =>
        logger.error(err)
        Future.Done
    }

  }


}