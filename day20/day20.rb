# --- Day 20: Pulse Propagation ---

def day20A(file)
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

  pulses = { lo: 0, hi: 0 }
  1000.times do
    pulses[:lo] += 1
    q = broadcast.map { |t| [:broadcaster, t, :lo] }

    until q.empty?
      origin, target, pulse = q.shift

      pulses[pulse] += 1

      next unless modules.include? target

      mod = modules[target]

      if mod[:type] == :%
        if pulse == :lo
          mod[:memory] = mod[:memory] == :on ? :off : :on
          new_pulse = mod[:memory] == :on ? :hi : :lo
          mod[:outputs].each { |out| q.push [target, out, new_pulse] }
        end
      else
        mod[:memory][origin] = pulse
        new_pulse = mod[:memory].values.all? { |p| p == :hi } ? :lo : :hi
        mod[:outputs].each { |out| q.push [target, out, new_pulse] }
      end
    end
  end

  pulses.values.inject(:*)
end

def day20B(file)
  File
    .read(file)
    .split("\n")
end
