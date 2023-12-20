# --- Day 19: Aplenty ---

def day19A(file)
  flows = {}
  workflows, ratings = File
                       .read(file)
                       .split("\n\n")
  workflows.split("\n").each do |wf|
    label, rest = wf.split('{')
    conditions = []
    rest[..-2].split(',').each do |step|
      conditions << if step.include? ':'
                      step.split(':')
                    else
                      step
                    end
    end
    flows[label] = conditions
  end

  ratings = ratings.split("\n").map do |rating|
    parts = {}
    rating[1..-2].split(',').each do |prop|
      field, val = prop.split('=')
      parts[field] = val.to_i
    end
    parts
  end
  ratings.map do |rating|
    nf = 'in'
    while nf != 'A' && nf != 'R'
      flow = flows[nf]
      flow.each do |cond|
        if cond.is_a? String
          nf = cond
          break
        end

        x = rating['x'] # rubocop:disable Lint/UselessAssignment
        m = rating['m'] # rubocop:disable Lint/UselessAssignment
        a = rating['a'] # rubocop:disable Lint/UselessAssignment
        s = rating['s'] # rubocop:disable Lint/UselessAssignment
        if eval(cond[0]) # rubocop:disable Security/Eval
          nf = cond[1]
          break
        end
      end
    end
    if nf == 'A'
      rating.values.sum
    else
      0
    end
  end.sum
end

def day19B(file)
  flows = {}
  workflows, = File
               .read(file)
               .split("\n\n")
  workflows.split("\n").each do |wf|
    label, rest = wf.split('{')
    rules = rest[..-2].split(',')
    conditions = [[], rules.slice!(-1)]
    rules.each do |rule|
      comparison, target = rule.split(':')
      key = comparison[0]
      cmp = comparison[1]
      n = comparison[2..].to_i
      conditions[0].push [key, cmp, n, target]
    end
    flows[label] = conditions
  end

  count = lambda do |ranges, name = 'in'| # rubocop:disable Metrics/BlockLength
    return 0 if name == 'R'

    if name == 'A'
      product = 1
      ranges.each_value do |lo, hi|
        product *= hi - lo + 1
      end
      return product
    end

    rules, fallback = flows[name]

    total = 0
    broke = false

    rules.each do |key, cmp, n, target|
      lo, hi = ranges[key]
      if cmp == '<'
        t = [lo, n - 1]
        f = [n, hi]
      else
        t = [n + 1, hi]
        f = [lo, n]
      end

      if t[0] <= t[1]
        copy = ranges.clone
        copy[key] = t
        total += count.call(copy, target)
      end

      if f[0] <= f[1]
        ranges = ranges.clone
        ranges[key] = f
      else
        broke = true
        break
      end
    end
    total += count.call(ranges, fallback) unless broke

    total
  end

  count.call(Hash[%w[x m a s].map { |h| [h, [1, 4000]] }])
end
