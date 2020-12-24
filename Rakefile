desc "Rakefile for ruby file listing"

Rake.application.options.trace_rules = true

SOURCE_FILES = Rake::FileList.new("**/*.rb") do |fl|
  fl.exclude("~*")
  fl.exclude(%r{/^scratch/})
end

task :default do
  puts SOURCE_FILES
end

task :list => SOURCE_FILES.ext(".rb")

rule ".rb" => -> (f) {source_for_rb(f)} do |t|
  sh "ls -l #{t}"
  sh "pandoc -f ruby -t html -o #{t.name}"
end

def source_for_rb(rb_file)
  SOURCE_FILES.detect{|f| f.ext('') == rb_file.ext('')}
end

