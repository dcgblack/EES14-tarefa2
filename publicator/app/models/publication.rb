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

  def publication_name
    "#{title}, #{local}"
  end

  def A_to_ref # Artigos
    str  = "#{authors_ref} #{title}"
    str += ": #{subtitle}" unless subtitle.empty?
    str += ". "
    str += "#{publishing_company}. " unless publishing_company.empty?
    str += "#{local}, "
    str += "v. #{volume}, " unless volume.empty?
    str += "n. #{publication_number}, " unless publication_number.empty?
    str += "p. #{initial_final_page}, " unless initial_final_page.empty?
    str += "#{year_of_publication}"
    str += "."

    str
  end

  def B_to_ref # Monografias e livros
    str  = "#{authors_ref} #{title}"
    str += ": #{subtitle}" unless subtitle.empty?
    str += ". "
    str += "#{edition} ed. " unless edition.empty?
    str += "#{local}: "
    str += "#{publishing_company}, " unless publishing_company.empty?
    str += "v. #{volume}, " unless volume.empty?
    str += "n. #{publication_number}, " unless publication_number.empty?
    str += "#{year_of_publication}"
    str += ". p. #{initial_final_page}" unless initial_final_page.empty?
    str += "."

    str
  end

  def C_to_ref # Dissertações e teses
    str  = "#{authors_ref} #{title}"
    str += ": #{subtitle}" unless subtitle.empty?
    str += ". #{year_of_publication}. "
    str += "#{description}. " unless description.empty?
    str += "#{publishing_company}. " unless publishing_company.empty?
    str += "#{local}. "
    str += "p. #{initial_final_page}." unless initial_final_page.empty?

    str
  end

  def D_to_ref # Meios eletrônicos
    str  = "#{authors_ref} #{title}"
    str += ": #{subtitle}" unless subtitle.empty?
    str += ". "
    str += "Disponível em: <#{local}>. "
    str += "Acesso em: #{year_of_publication}. "
    str += "p. #{initial_final_page}." unless initial_final_page.empty?

    str
  end

  def E_to_ref # RFCs
    str  = "#{authors_ref} #{title}"
    str += ": #{subtitle}" unless subtitle.empty?
    str += ". "
    str += "#{description}. " unless description.empty?
    str += "#{local}, "
    str += "#{publishing_company}, " unless publishing_company.empty?
    str += "#{year_of_publication}. "
    str += "p. #{initial_final_page}." unless initial_final_page.empty

    str
  end

  def F_to_ref # Normas
    str  = "#{authors_ref.upcase} #{title}"
    str += ": #{subtitle}" unless subtitle.empty?
    str += ". "
    str += "#{description}. " unless description.empty?
    str += "#{local}: "
    str += "#{year_of_publication}."

    str
  end

  def self.search(query)
    if query.present?
      joins(:authors).where(['title LIKE :query OR
              year_of_publication LIKE :query OR
              description LIKE :query OR
              subtitle LIKE :query OR
              edition LIKE :query OR
              publishing_company LIKE :query OR
              category LIKE :query OR
              volume LIKE :query OR
              authors.name LIKE :query OR
              authors.surname LIKE :query OR
              local LIKE :query', query: "%#{query}%"])
    else
      all
    end
  end

  def self.most_recent
    order(created_at: :desc)
  end

  private

  def authors_ref
    authors_str = ""
    authors.each do |author|
      authors_str += "#{author.surname.to_s.upcase}, " if not author.surname.nil? or author.surname.to_s.empty?
      authors_str += "#{author.name}. "
    end

    authors_str
  end
end
