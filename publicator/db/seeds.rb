User.delete_all

params =  { :user =>
    {
    :name => 'kratos',
    :email => 'kratos@sparta.com',
    :password => '123',
    :password_confirmation => '123'
  }
}

current_user = User.create!(params[:user])

params =  { :publication =>
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

current_user.publications.build(params[:publication]).save