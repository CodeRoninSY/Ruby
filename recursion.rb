# recursion - writing recursive funcs is all about determining the "terminal clause"
# tail-call optimization
RubyVM::InstructionSequence.compile_option =
  {
    tailcall_optimization: true,
    trace_instruction: false
  }

# tail-recursive factorial function
def factorial(x, acc=1)
  return acc if x <= 1
  factorial(x - 1, acc * x)
end

pp factorial(100)
