{:non-pedantic {:pedantic? :ranges}
 :vizdeps {:plugins [[walmartlabs/vizdeps "0.1.6"]]}
 :shared {:plugins [[com.jakemccrary/lein-test-refresh "0.16.0"]
                    [lein-pprint "1.1.2"]]
          :figwheel {:open-file-command "figwheel-file-opener"}
          :test-refresh {:growl true}
          #_#_:source-paths ["/users/kimmoko/.clojure/user"]}
 :global-opts {:global-vars {*print-length* 100}}
 :ancient {:plugins [[lein-ancient "0.6.15"]]}
 :injected-tools {:dependencies [[im.chit/lucid.core.inject "1.2.8"]
                                 [org.clojure/tools.namespace "0.2.11"]
                                 [pjstadig/humane-test-output "0.8.1"]
                                 [org.clojure/tools.cli "0.3.5"]]
                  :injections [(require '[lucid.core.inject :as inject])
                               (inject/in
                                [clojure.tools.namespace.repl refresh]
                                [clojure.pprint pprint]
                                [clojure.repl doc source])
                               (require 'pjstadig.humane-test-output)
                               (pjstadig.humane-test-output/activate!)]}
 :moar-opts {:jvm-opts ["-XX:+UnlockDiagnosticVMOptions"
                        "-XX:+DebugNonSafepoints"
                        "-XX:+UnlockCommercialFeatures"
                        "-XX:+FlightRecorder"]}
 :yagni {:plugins [[venantius/yagni "0.1.2"]]}
 :line-count {:plugins [[lein-count "1.0.9"]]}
 :cider {:plugins [[cider/cider-nrepl "0.21.0"]
                   [refactor-nrepl "2.4.0"]]}
 :user [:shared :global-opts :moar-opts :injected-tools]
 :wait-debugger {:jvm-opts ["-agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=5005"
                            "-Djava.rmi.server.hostname=127.0.0.1"]}
 :clojars-release {:deploy-repositories [["releases" {:url "https://clojars.org/repo/"
                                                      :password :gpg
                                                      :username :gpg}]]}
 :eastwood {:plugins [[jonase/eastwood "0.3.3"]]}}
