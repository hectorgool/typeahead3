package code


import net.liftweb.json._


package object comet{

  case class Term( t:String )

  case class Docuemnt( _id:String, name:String, location:String )
  case class Results( hits:HitsList )
  case class HitsList( hits:List[Hits] )
  case class Hits( _id:String, _source:Source )
  case class Source( name:String, location:String )

  case class Message(msg: List[String])

}
