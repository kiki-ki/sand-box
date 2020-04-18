# frozen_string_literal: true

module Printable
  def print
    p 'print out.'
  end

  def prepare_cover
    p 'covered.'
  end
end

module Document
  def print_to_screen
    prepare_cover
    format_for_screen
    print
  end

  def format_for_screen
    p 'formated.'
  end

  def print
    p 'in the Document.'
  end
end

class Book
  prepend Document
  include Printable
end
