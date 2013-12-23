name := "Lift 2.5 starter template"

version := "0.0.1"

organization := "net.liftweb"

scalaVersion := "2.10.0"

resolvers ++= Seq("snapshots"     at "http://oss.sonatype.org/content/repositories/snapshots",
                  "releases"      at "http://oss.sonatype.org/content/repositories/releases",
                  "twitter-repo"  at "http://maven.twttr.com"
                )

seq(com.github.siasia.WebPlugin.webSettings :_*)

unmanagedResourceDirectories in Test <+= (baseDirectory) { _ / "src/main/webapp" }

scalacOptions ++= Seq("-deprecation", "-unchecked")

port in container.Configuration := 8080

libraryDependencies ++= {
  val liftVersion = "2.5"
  Seq(
    "net.liftweb"             %% "lift-webkit"            % liftVersion           % "compile",
    "org.eclipse.jetty"        % "jetty-webapp"           % "8.1.7.v20120910"     % "container,test",
    "org.eclipse.jetty.orbit"  % "javax.servlet"          % "3.0.0.v201112011016" % "container,test" artifacts Artifact("javax.servlet", "jar", "jar"),
    "ch.qos.logback"           % "logback-classic"        % "1.0.6",
    "org.specs2"              %% "specs2"                 % "1.14"                % "test",
    "net.liftweb"             %% "lift-json"              % liftVersion           % "compile",
    "com.twitter"              % "finagle-core_2.10"      % "6.10.0",
    "com.twitter"              % "finagle-stream_2.10"    % "6.10.0",
    "com.twitter"              % "finagle-http_2.10"      % "6.10.0",
    "org.twitter4j"            % "twitter4j-core"         % "3.0.5"
  )
}

