{:shared {:plugins [#_[jonase/eastwood "0.2.3"]
                    [lein-ancient "0.6.10" :exclusions [org.apache.httpcomponents/httpclient
                                                        commons-codec]]
                    [org.clojure/tools.nrepl "0.2.12" :exclusions [org.clojure/clojure]]
                    [com.jakemccrary/lein-test-refresh "0.16.0"]
                    [lein-pprint "1.1.2"]]
          :global-vars {*print-length* 100}
          :figwheel {:open-file-command "figwheel-file-opener"}
          :test-refresh {:growl true}}
 :lucidity {:dependencies [[im.chit/lucid.core.inject "1.2.8"]
                           [im.chit/lucid.mind "1.2.8"]
                           [org.clojure/tools.namespace "0.2.11"]
                           [pjstadig/humane-test-output "0.8.1"]]
            :injections [(require '[lucid.core.inject :as inject])
                         (inject/in
                          [clojure.tools.namespace.repl refresh]
                          clojure.core
                          [lucid.mind .> .? .* .% .%> .& .>ns .>var]
                          >
                          [clojure.pprint pprint]
                          [clojure.java.shell sh])
                         (require 'pjstadig.humane-test-output)
                         (pjstadig.humane-test-output/activate!)]}
 :moar-opts {:jvm-opts ["-XX:+UnlockDiagnosticVMOptions"
                        "-XX:+DebugNonSafepoints"
                        "-XX:+UnlockCommercialFeatures"
                        "-XX:+FlightRecorder"]}
 :yagni {:plugins [[venantius/yagni "0.1.2"]]}
 :cider {:plugins [[cider/cider-nrepl "0.14.0"]
                   #_[refactor-nrepl "2.2.0"]]}
 :user [:shared :moar-opts :lucidity]}

