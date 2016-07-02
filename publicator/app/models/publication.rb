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

  def publication_name
    "#{title}, #{local}"
  end

  def A_to_ref
  end
  def C_to_ref
  end
  def D_to_ref
  end
  def E_to_ref
  end
  def F_to_ref
  end

  def B_to_ref
    str  = "#{other}. #{title}"
    str += ": #{subtitle}" unless subtitle.empty?
    str += ". "
    str += "#{edition} ed. " unless edition.empty?
    str += "#{local}: "
    str += "#{publishing_company}, " unless publishing_company.empty?
    str += "v. #{volume}, " unless volume.empty?
    str += "n. #{publication_number}, " unless publication_number.empty?
    str += "#{year_of_publication}"
    str += "p. #{initial_final_page}" unless initial_final_page.empty?
    str += "."

    str
  end
end
