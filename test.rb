require 'rumale'

# Load the testing dataset.
samples, labels = Rumale::Dataset.load_libsvm_file('pendigits.t')

# Load the model.
transformer = Marshal.load(File.binread('transformer.dat'))
classifier = Marshal.load(File.binread('classifier.dat'))

# Map testing data to RBF kernel feature space.
transformed = transformer.transform(samples)

# Classify the testing data and evaluate prediction results.
puts("Accuracy: %.1f%%" % (100.0 * classifier.score(transformed, labels)))

# Other evaluating approach
# results = classifier.predict(transformed)
# evaluator = Rumale::EvaluationMeasure::Accuracy.new
# puts("Accuracy: %.1f%%" % (100.0 * evaluator.score(results, labels)))
