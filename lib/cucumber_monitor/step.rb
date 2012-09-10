module CucumberMonitor

  class Step

    attr_accessor :description, :parent, :id

    def initialize(description, parent, id)
      @description = description.strip
      @parent = parent
      @id = id
    end

    def siblings
      parent.steps - [self]
    end

    def previous
      siblings.where(id: self.id - 1)
    end

    def next
      siblings.where(id: self.id + 1)
    end

    def table?
      description.scan(/\|/).length >= 2 && description[0] == "|" && description[-1] == "|"
    end

    def table_first_line?
      table? && (self.previous.blank? || self.previous.not_a_table)
    end

    def table_last_line?
      table? && (self.next.blank? || self.next.not_a_table)
    end

    def table_row?
      table? && !table_first_line?
    end

    def table_content
      if table?
        description.split("|").map{|l| l.strip}[1..-1]
      end
    end

    def not_a_table
      !table?
    end

    def formatted
      output = ""
      if table_first_line?
        output << "<table>\n"
        output << "  <tr>\n"
        table_content.each do |th|
          output << "    <th>#{th}</th>\n"
        end
        output << "  </tr>\n"
        output << "</table>\n" if table_last_line?
      elsif table_row?
        output << "  <tr>\n"
        table_content.each do |td|
          output << "    <td>#{td}</td>\n"
        end
        output << "  </tr>\n"
        output << "</table>\n" if table_last_line?
      else
        output << description
      end
      output
    end

  end

end