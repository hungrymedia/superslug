class << ActiveRecord::Base

  def has_superslug(source = :title, dest = :slug, options = {})

    source = source.to_s
    dest   = dest.to_s

    # ---------------------------------------- Query Helpers

    def find(input)
      if input.class == Array
        super
      else
        input.to_i.to_s == input.to_s ? super : find_by_slug(input)
      end
    end

    define_method "to_param" do
      send(dest)
    end

    # ---------------------------------------- Validations

    validates :"#{source}", :presence => true

    # ---------------------------------------- Callbacks

    after_save :"convert_#{source}_to_#{dest}"

    define_method "convert_#{source}_to_#{dest}" do
      # reference the separator option
      separator = options[:separator].present? ? options[:separator] : '-'
      # Set the slug column to the source column if it's
      # empty, or always set it to the source if overridden
      # in options
      if options[:force_update] == true
        superslug = self.send(source)
      else
        superslug = send(dest).blank? ? self.send(source) : self.send(dest)
      end
      # make lower case
      superslug = superslug.downcase.strip
      # replace ampersands with 'and'
      superslug.gsub!(/\&/, ' and ')
      # remove all bad characters
      # (we allow hyphens, underscores, and plus marks)
      superslug.gsub!(/[^a-zA-Z0-9 \-\_]/, "")
      # replace spaces with underscores
      superslug.gsub!(/\ /, separator)
      # replace repeating underscores
      superslug.gsub!(/#{separator}+/, separator)
      # Find all records with the same slug value for the
      # slug column
      if options[:context]
        duplicates = self.send(options[:context].to_s)
          .send(self.class.table_name.to_s)
          .where(dest.to_sym => superslug)
      else
        duplicates = self.class.name.constantize.where(dest.to_sym => superslug)
      end
      # Append the ID to the end of the slug if the slug
      # column is already taken
      if (duplicates - [self]).size > 0
        superslug = "#{superslug}#{separator}#{self.id}"
      end
      # Update the column in the database unless it matches
      # what's already there
      unless superslug == self.send(dest)
        update_columns(dest.to_sym => superslug)
      end
    end

  end

end
