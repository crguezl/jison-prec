desc "compile precedencia grammar"
task :default do
  sh "jison precedencia.jison precedencia.l"
end

desc "run precedencia.js"
task :run do
  sh "cat input.txt"
  sh "node precedencia.js input.txt"
end

desc "produce the automata tables"
task :automata do
  sh "bison -v precedencia.jison"
end
