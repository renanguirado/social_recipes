require 'rails_helper'

feature 'User Register Recipes' do

  scenario 'successfully' do
    #setup
    recipe = Recipe.new(name: 'Bolo de Laranja',
                        kitchen: 'Brasileira',
                        kind_of_food: 'Doce',
                        yield: 'seis pessoas',
                        preparation_time: '40 miniutos',
                        difficulty_level: 'facil',
                        ingredients: '4 ovos
                                      2 xícaras (chá) de açúcar
                                      1 xícara (chá) de óleo
                                      suco de 2 laranjas
                                      casca de 1 laranja
                                      2 xícaras (chá) de farinha de trigo
                                      1 colher (sopa) de fermento',
                        method_of_preparation: 'Bata no liquidificador os ovos, o açúcar, o óleo, o suco e a casca da laranja
    Passe para uma tigela e acrescente a farinha de trigo e o fermento
    Leve para assar em uma forma com furo central, untada e enfarinhada, por mais ou menos 30 minutos
    Desenforme o bolo e molhe com suco de laranja')
    #execução
    visit new_recipe_path

    fill_in 'Nome',                     with: recipe.name
    fill_in 'Cozinha',                 with: recipe.kitchen
    fill_in 'Tipo De Comida',          with: recipe.kind_of_food
    fill_in 'Rendimento',              with: recipe.yield
    fill_in 'Tempo de Preparo',        with: recipe.preparation_time
    fill_in 'Nivel de Dificuldade',    with: recipe.difficulty_level
    fill_in 'ingredientes',            with: recipe.ingredients
    fill_in 'Modo de Preparo',         with: recipe.method_of_preparation

    click_on 'Cadastrar Receita'
    #expectativa
    expect(page).to have_css('h1', text: recipe.name)
    expect(page).to have_content recipe.kitchen
    expect(page).to have_content recipe.kind_of_food
    expect(page).to have_content recipe.yield
    expect(page).to have_content recipe.preparation_time
    expect(page).to have_content recipe.difficulty_level
    expect(page).to have_content   recipe.ingredients
    expect(page).to have_content recipe.method_of_preparation

  end

  scenario 'and should fill all fields'
    #execução
    visit new_recipe_path

    click_on 'Cadastrar Receita'
    #expectativa
    expect(page).to have_css 'Não foi possivel cadastrar a receita'
end
