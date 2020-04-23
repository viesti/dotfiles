{:non-pedantic {:pedantic? :ranges}
 :vizdeps {:plugins [[walmartlabs/vizdeps "0.1.6"]]}
 :shared {:plugins [[com.jakemccrary/lein-test-refresh "0.24.1"]
                    [lein-pprint "1.1.2"]]
          :figwheel {:open-file-command "figwheel-file-opener"}
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
 :jvm-opts {:jvm-opts [;; Keep stacktraces
                       "-XX:-OmitStackTraceInFastThrow"]}
 :yagni {:plugins [[venantius/yagni "0.1.2"]]}
 :line-count {:plugins [[lein-count "1.0.9"]]}
 :cider {:plugins [[cider/cider-nrepl "0.24.0"]
                   [refactor-nrepl "2.5.0"]]}
 :wait-debugger {:jvm-opts ["-agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=5005"
                            "-Djava.rmi.server.hostname=127.0.0.1"]}
 :clojars-release {:deploy-repositories [["releases" {:url "https://clojars.org/repo/"
                                                      :password :gpg
                                                      :username :gpg}]]}
 :eastwood {:plugins [[jonase/eastwood "0.3.5"]]}
 :clj-async-profiler {:dependencies [[com.clojure-goes-fast/clj-async-profiler "0.4.0"]]
                      :jvm-opts ["-XX:+UnlockDiagnosticVMOptions"
                                 "-XX:+DebugNonSafepoints"]}
 :nrebl  {:repl-options {:nrepl-middleware [nrebl.middleware/wrap-nrebl]}
          :dependencies [[rickmoynihan/nrebl.middleware "0.3.1"]
                         [org.clojure/core.async "0.4.490"]
                         [cljfmt "0.6.4"]]
          :resource-paths ["/Users/kimmoko/home/rebl/REBL-0.9.220/REBL-0.9.220.jar"]
          :injections [(require 'nrebl.middleware) (require '[cognitect.rebl :as rebl])]}
 :honeysql {:dependencies [[honeysql "0.9.8"]
                           [nilenso/honeysql-postgres "0.2.6"]]}
 :hashp {:dependencies [[hashp "0.1.0"]]
         :injections [(require 'hashp.core)]}
 :user [:shared :global-opts :jvm-opts :injected-tools :hashp]}
