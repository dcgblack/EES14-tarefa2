User.delete_all
Publication.delete_all

params =  { :user =>
    {
    :name => 'kratos',
    :email => 'kratos@sparta.com',
    :password => '123',
    :password_confirmation => '123'
  }
}

current_user = User.create!(params[:user])

params = []
params <<  { :publication =>
    {
    :category => 'Artigos',
    :title => 'Ciclo de vida dos Preas',
    :subtitle => 'Prea eh mato',
    :edition => '2º',
    :local => 'Eldorado do Sul',
    :publishing_company => 'Revista Roedores',
    :year_of_publication => '2012',
    :initial_final_page => '7-22',
    :volume => '1',
    :publication_number => '3',
    :authors_attributes => [{
        :name => 'Argel',
        :surname => 'Fulks',
        :curriculum_lattes => 'http://www.google.com',
        :institution => 'Escola das Ruas do RS',
      }]
  }
}

params <<  { :publication =>
    {
    :category => 'Artigos',
    :title => 'Escola das',
    :subtitle => 'Ruas',
    :edition => '2º',
    :local => 'Porto Alegre',
    :publishing_company => 'Revista Temp',
    :year_of_publication => '2001',
    :initial_final_page => '90-122',
    :volume => '7',
    :publication_number => '9',
    :authors_attributes => [{
        :name => 'Luffy',
        :surname => 'Monkey',
        :curriculum_lattes => 'http://www.google.com',
        :institution => 'Escola das Ruas do RS',
      }, {
        :name => 'Anderson',
        :surname => 'Silva',
        :curriculum_lattes => 'http://www.google.com',
        :institution => 'UFC' }]
  }
}

params.each do |param|
  current_user.publications.build(param[:publication]).save
end