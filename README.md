# BIGQUERY_DELETION_QUERY

Essa query SQL executa uma operação de exclusão condicional em uma tabela chamada tabela.final, removendo os registros que não possuem correspondência na tabela tabela.temporaria com base na coluna notas_id.

## Explicação Passo a Passo:
-DELETE FROM tabela.final AS tf:<br>
Esta parte da query define a tabela de onde os dados serão excluídos. Aqui, tf é um alias (um nome curto) para a tabela tabela.final. A query irá deletar registros desta tabela.<br>

-WHERE NOT EXISTS:
Esta cláusula filtra os registros da tabela tabela.final que serão excluídos. Ela verifica se uma condição específica não é atendida. No caso, a condição é a inexistência de um registro correspondente na tabela tabela.temporaria.<br>

````sql(SELECT 1 FROM tabela.temporaria AS tt WHERE tf.notas_id = tt.notas_id)````

Esta subquery é executada para cada registro da tabela tabela.final. A subquery seleciona o valor 1 (o valor 1 é usado porque não precisamos retornar dados específicos, apenas verificar a existência de um registro). A condição da subquery é que o valor de notas_id na tabela tabela.final (representada como tf.notas_id) deve coincidir com o valor de notas_id na tabela tabela.temporaria (representada como tt.notas_id).<br>

Se existir um registro na tabela tabela.temporaria com o mesmo notas_id que na tabela tabela.final, a subquery retorna um resultado, e o registro não será excluído.<br>
Se não existir tal registro na tabela tabela.temporaria, a subquery não retorna nenhum resultado, e o registro será excluído da tabela tabela.final.<br>

## Resumo
Esta query exclui da tabela tabela.final todos os registros que não têm um correspondente na tabela tabela.temporaria, com base na coluna notas_id. Se um registro na tabela tabela.final tiver um notas_id que não exista na tabela tabela.temporaria, ele será removido.
