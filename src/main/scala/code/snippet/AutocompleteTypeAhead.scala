package code
package snippet


import net.liftweb.common.{Loggable}
import net.liftweb.util.Helpers._
import net.liftweb.http.{SHtml}
import net.liftweb.http.js.{JE}
import comet._


class AutocompleteTypeAhead extends Loggable {

  var term = ""

  def doProcess = {
    logger.info("\n\nThe terms is: " + term + "\n\n")
  }

  def render = {

    "#autocomplete [onkeyup]" #> ( SHtml.ajaxCall(JE.JsRaw("""$("#autocomplete").val()""") , InboxActor ! Term(_) ) ) andThen
    "#autocomplete"           #> ( SHtml.text(term, term = _)) andThen
    "#submit"                 #> ( SHtml.hidden( doProcess _ ))

  }


}