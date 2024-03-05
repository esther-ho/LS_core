def group(array)
  yield(array)
end

birds = %w(raven finch hawk eagle)
group(birds) { |_, _, *raptors| p raptors }
