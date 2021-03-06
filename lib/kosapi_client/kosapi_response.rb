module KOSapiClient
  class KOSapiResponse

    attr_reader :contents

    def initialize(contents)
      @contents = contents
    end

    def is_paginated?
      contents[:atom_feed]
    end

    def items
      if is_paginated?
        contents[:atom_feed][:atom_entry]
      else
        [contents[:atom_entry]]
      end
    end

    def item
      items.first
    end

    def links_hash
      return nil unless contents[:atom_feed]
      contents[:atom_feed][:atom_link]
    end

  end
end
