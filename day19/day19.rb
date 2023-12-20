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
  File
    .read(file)
    .split("\n")
end
