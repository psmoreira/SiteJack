# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Evento.create!(descricao: 'Evento1', tipoEvento: 'Casamento', numPessoas: '20')
Evento.create!(descricao: 'Evento2', tipoEvento: 'Casamento', numPessoas: '10')
Evento.create!(descricao: 'Evento3', tipoEvento: 'Casamento', numPessoas: '220')
Evento.create!(descricao: 'Evento4', tipoEvento: 'Casamento', numPessoas: '202')
Evento.create!(descricao: 'Evento5', tipoEvento: 'Casamento', numPessoas: '230')
Evento.create!(descricao: 'Evento6', tipoEvento: 'Casamento', numPessoas: '1')

Funcionario.create!(nome: 'Ze Manel 1', contribuinte: '123332323', precoHora1: '100')
Funcionario.create!(nome: 'Ze Manel 2', contribuinte: '123332323', precoHora1: '140')
Funcionario.create!(nome: 'Ze Manel 3', contribuinte: '123332323', precoHora1: '130')
Funcionario.create!(nome: 'Ze Manel 4', contribuinte: '123332323', precoHora1: '10')
Funcionario.create!(nome: 'Ze Manel 5', contribuinte: '123332323', precoHora1: '10')
Funcionario.create!(nome: 'Ze Manel 6', contribuinte: '123332323', precoHora1: '180')
Funcionario.create!(nome: 'Ze Manel 7', contribuinte: '123332323', precoHora1: '20')



Trabalho.create!(funcionario_id: '1', regularizado: false, precoHora1: '100',evento_id: 1 )
Trabalho.create!(funcionario_id: '1', regularizado: true, precoHora1: '100',evento_id: 1 )
Trabalho.create!(funcionario_id: '2', regularizado: true, precoHora1: '100',evento_id: 2 )
Trabalho.create!(funcionario_id: '3', regularizado: false, precoHora1: '100',evento_id: 2 )
Trabalho.create!(funcionario_id: '3', regularizado: false, precoHora1: '100',evento_id: 1 )
Trabalho.create!(funcionario_id: '1', regularizado: false, precoHora1: '100',evento_id: 1 )
Trabalho.create!(funcionario_id: '1', regularizado: true, precoHora1: '100',evento_id: 1 )
Trabalho.create!(funcionario_id: '2', regularizado: true, precoHora1: '100',evento_id: 2 )
Trabalho.create!(funcionario_id: '3', regularizado: false, precoHora1: '100',evento_id: 2 )
Trabalho.create!(funcionario_id: '3', regularizado: false, precoHora1: '100',evento_id: 1 )
Trabalho.create!(funcionario_id: '1', regularizado: false, precoHora1: '100',evento_id: 1 )
Trabalho.create!(funcionario_id: '1', regularizado: true, precoHora1: '100',evento_id: 1 )
Trabalho.create!(funcionario_id: '2', regularizado: true, precoHora1: '100',evento_id: 2 )
Trabalho.create!(funcionario_id: '3', regularizado: false, precoHora1: '100',evento_id: 2 )
Trabalho.create!(funcionario_id: '3', regularizado: false, precoHora1: '100',evento_id: 1 )


Pagamento.create!(funcionario_id: '1',evento_id: '1', trabalho_id: '1' , regularizado: false, precoTotal: '120' )
Pagamento.create!(funcionario_id: '1',evento_id: '2', trabalho_id: '2' , regularizado: false, precoTotal: '200' )
Pagamento.create!(funcionario_id: '1',evento_id: '3', trabalho_id: '3' , regularizado: false, precoTotal: '230' )
Pagamento.create!(funcionario_id: '1',evento_id: '4', trabalho_id: '4' , regularizado: false, precoTotal: '30' )
