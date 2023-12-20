# --- Day 20: Pulse Propagation ---

def init_modules(file)
  modules = {}
  broadcast = []
  File
    .read(file)
    .split("\n")
    .each do |l|
      name, out = l.split(' -> ')
      outputs = out.split(', ').map(&:to_sym)
      if name == 'broadcaster'
        broadcast = outputs
      else
        type = name.slice!(0).to_sym
        modules[name.to_sym] = {
          outputs:,
          type:,
          memory: type == :% ? :off : {}
        }
      end
    end

  modules.each do |name, mod|
    mod[:outputs].each do |output|
      modules[output][:memory][name] = :lo if modules.include?(output) && modules[output][:type] == :&
    end
  end

  [modules, broadcast]
end

def get_outputs_from_module(modules, origin, target, pulse)
  mod = modules[target]

  if mod[:type] == :%
    if pulse == :lo
      mod[:memory] = mod[:memory] == :on ? :off : :on
      new_pulse = mod[:memory] == :on ? :hi : :lo
      mod[:outputs].map { |out| [target, out, new_pulse] }
    end
  else
    mod[:memory][origin] = pulse
    new_pulse = mod[:memory].values.all? { |p| p == :hi } ? :lo : :hi
    mod[:outputs].map { |out| [target, out, new_pulse] }
  end
end

def day20A(file)
  modules, broadcast = init_modules(file)

  pulses = { lo: 0, hi: 0 }
  1000.times do
    pulses[:lo] += 1
    q = broadcast.map { |t| [:broadcaster, t, :lo] }

    until q.empty?
      origin, target, pulse = q.shift

      pulses[pulse] += 1

      next unless modules.include? target

      outputs = get_outputs_from_module(modules, origin, target, pulse)
      q.concat(outputs) if outputs
    end
  end

  pulses.values.inject(:*)
end

def day20B(file)
  modules, broadcast = init_modules(file)

  feeder, = modules.find do |_name, mod|
    mod[:outputs].include? :rx
  end

  cycles = {}
  seen = {}
  modules.each do |name, mod|
    seen[name] = 0 if mod[:outputs].include? feeder
  end

  presses = 0
  loop do
    presses += 1
    q = broadcast.map { |t| [:broadcaster, t, :lo] }

    until q.empty?
      origin, target, pulse = q.shift

      rx_active = target == :rx && pulse == :lo
      break if rx_active

      next unless modules.include? target

      if target == feeder && pulse == :hi
        seen[origin] += 1
        if !cycles.include? origin
          cycles[origin] = presses
        else
          raise 'This is wrong' unless presses == (seen[origin] * cycles[origin]) # rubocop:disable Metrics/BlockNesting
        end
      end

      return cycles.values.reduce(1, &:lcm) if seen.values.all?(&:positive?)

      outputs = get_outputs_from_module(modules, origin, target, pulse)
      q.concat(outputs) if outputs
    end
  end

  presses
end
