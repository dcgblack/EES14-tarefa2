class Publication < ActiveRecord::Base
  has_many :authors, dependent: :destroy
  accepts_nested_attributes_for :authors
  belongs_to :user

  CATEGORIES = {
                "A" => "Artigos",
                "B" => "Monografias e livros",
                "C" => "Dissertações e teses",
                "D" => "Meios eletrônicos",
                "E" => "RFCs",
                "F" => "Normas"
              }

  def self.get_category_key(value)
    CATEGORIES.key(value)
  end

  def self.get_years_from_category(pubs)
    pubs.map{|pub| pub.year_of_publication}.uniq
  end

  def self.get_years
    select("year_of_publication").map{|pub| pub.year_of_publication}.uniq
  end

  def self.get_publications_by_category(category)
    where("category = :cat", {cat: category})
  end

  def self.get_publications_by_category_and_year(category, year)
    where("category = :cat AND year_of_publication = :year",
          {cat: category, year: year})
  end

  def self.get_publications_by_category(category)
    where("category = :cat", {cat: category})
  end

  def publication_name
    "#{title}, #{local}"
  end

  def A_to_ref # Artigos
    str  = "#{authors_ref} #{title}"
    str += ": #{subtitle}" unless is_empty? subtitle
    str += ". "
    str += "#{publishing_company}. " unless is_empty? publishing_company
    str += "#{local}, "
    str += "v. #{volume}, " unless is_empty? volume
    str += "n. #{publication_number}, " unless is_empty? publication_number
    str += "p. #{initial_final_page}, " unless is_empty? initial_final_page
    str += "#{year_of_publication}"
    str += "."

    str
  end

  def B_to_ref # Monografias e livros
    str  = "#{authors_ref} #{title}"
    str += ": #{subtitle}" unless is_empty? subtitle
    str += ". "
    str += "#{edition} ed. " unless is_empty? edition
    str += "#{local}: "
    str += "#{publishing_company}, " unless is_empty? publishing_company
    str += "v. #{volume}, " unless is_empty? volume
    str += "n. #{publication_number}, " unless is_empty? publication_number
    str += "#{year_of_publication}"
    str += ". p. #{initial_final_page}" unless is_empty? initial_final_page
    str += "."

    str
  end

  def C_to_ref # Dissertações e teses
    str  = "#{authors_ref} #{title}"
    str += ": #{subtitle}" unless is_empty? subtitle
    str += ". #{year_of_publication}. "
    str += "#{description}. " unless is_empty? description
    str += "#{publishing_company}. " unless is_empty? publishing_company
    str += "#{local}. "
    str += "p. #{initial_final_page}." unless is_empty? initial_final_page

    str
  end

  def D_to_ref # Meios eletrônicos
    str  = "#{authors_ref} #{title}"
    str += ": #{subtitle}" unless is_empty? subtitle
    str += ". "
    str += "Disponível em: <#{local}>. "
    str += "Acesso em: #{year_of_publication}. "
    str += "p. #{initial_final_page}." unless is_empty? initial_final_page

    str
  end

  def E_to_ref # RFCs
    str  = "#{authors_ref} #{title}"
    str += ": #{subtitle}" unless is_empty? subtitle
    str += ". "
    str += "#{description}. " unless is_empty? description
    str += "#{local}, "
    str += "#{publishing_company}, " unless is_empty? publishing_company
    str += "#{year_of_publication}. "
    str += "p. #{initial_final_page}." unless is_empty? initial_final_page

    str
  end

  def F_to_ref # Normas
    str  = "#{authors_ref.upcase} #{title}"
    str += ": #{subtitle}" unless is_empty? subtitle
    str += ". "
    str += "#{description}. " unless is_empty? description
    str += "#{local}: "
    str += "#{year_of_publication}."

    str
  end

  def self.search(query)
    if query.present?
      joins(:authors).where(['title ILIKE :query OR
              year_of_publication ILIKE :query OR
              description ILIKE :query OR
              subtitle ILIKE :query OR
              edition ILIKE :query OR
              publishing_company ILIKE :query OR
              category ILIKE :query OR
              volume ILIKE :query OR
              authors.name ILIKE :query OR
              authors.surname ILIKE :query OR
              local ILIKE :query', query: "%#{query}%"])
    else
      all
    end
  end

  def self.most_recent
    order(created_at: :desc)
  end

  private

  def is_empty?(value)
    if value.respond_to? :empty?
      value.empty?
    else
      value.nil?
    end
  end

  def authors_ref
    authors_str = ""

    if authors.size > 3
      authors_str += "#{authors.first.surname.to_s.upcase}, " unless is_empty? authors.first.surname
      authors_str += "#{authors.first.name}. "
      authors_str += "et al. "
    else
      authors.each do |author|
        authors_str += "#{author.surname.to_s.upcase}, " unless is_empty? author.surname
        authors_str += "#{author.name}. "
      end
    end

    authors_str
  end
end
