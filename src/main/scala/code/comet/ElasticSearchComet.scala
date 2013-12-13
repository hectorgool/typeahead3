package code
package comet


import net.liftweb.http._
import net.liftweb.http.js.{JsCmds, JsCmd, JE}
import net.liftweb.http.js.JE._
import net.liftweb.json.DefaultFormats
import net.liftweb.json.JsonAST.JValue


class ElasticSearchComet extends NamedCometActorTrait{


  implicit val formats = DefaultFormats

  override def lowPriority = {
    case v @ Message(msg) => {
      partialUpdate( suggest(msg) )
    }
  }

  def suggest( l : List[String] ): JsCmd = {

    val documents = l.map{
      document => Str( document )
    }
    val terms = JsArray(documents).toJsCmd
    logger.info("\n\nMaking suggestion for terms: " + terms + "\n\n")
    JE.JsRaw( "myAutocomplete(" + terms + " )" ).cmd

  }

  def render = {

    "#render" #> ""

  }


}
