package code

import comet._
import lib._
import net.liftweb.actor.LiftActor
import net.liftweb.common._
import net.liftweb.http.NamedCometListener


object InboxActor extends LiftActor with Logger{


  override def messageHandler ={

    case Term(t) => {
      SearchTerms.search( t )
    }

    case m @ Message(_) => {
      NamedCometListener.getDispatchersFor(Full("term")).foreach(actor => actor.map(_ ! m))
    }

  }


}