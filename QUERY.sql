DELETE FROM tabela.final AS tf
WHERE NOT EXISTS (
  SELECT 1
  FROM tabela.temporaria AS tt
  WHERE tf.notas_id = tt.notas_id
)
