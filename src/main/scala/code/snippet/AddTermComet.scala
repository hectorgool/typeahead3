package code
package snippet

import net.liftweb.http.NamedCometActorSnippet

object AddTermComet extends NamedCometActorSnippet {
  def name = "term"
  def cometClass = "ElasticSearchComet"
}