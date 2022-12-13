def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

bar(foo)
# `foo` returns "yes"
# `bar("yes")` returns "no" since `param != "no"`
