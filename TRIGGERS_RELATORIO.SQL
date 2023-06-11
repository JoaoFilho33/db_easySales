CREATE TRIGGER atualizar_relatorio_vendas_pendentes
AFTER INSERT ON ItemVenda
FOR EACH ROW
EXECUTE FUNCTION relatorio_vendas_pendentes();

CREATE TRIGGER atualizar_relatorio_vendas_quitadas
AFTER UPDATE ON Venda
FOR EACH ROW
EXECUTE FUNCTION relatorio_vendas_quitadas();

CREATE TRIGGER atualizar_relatorio_vendas_efetuadas
AFTER UPDATE ON ItemVenda
FOR EACH ROW
EXECUTE FUNCTION relatorio_vendas_efetuadas();

CREATE TRIGGER atualizar_relatorio_vendas_efetuadas
AFTER UPDATE ON ItemVenda
FOR EACH ROW
EXECUTE FUNCTION relatorio_vendas_efetuadas();

CREATE TRIGGER atualizar_relatorio_status_produto
AFTER UPDATE ON Estoque
FOR EACH ROW
EXECUTE FUNCTION relatorio_status_produto();

CREATE TRIGGER atualizar_verificar_disponibilidade_produto
AFTER UPDATE ON Estoque
FOR EACH ROW
EXECUTE FUNCTION verificar_disponibilidade_produto();

CREATE TRIGGER tr_relatorio_vendas_pendentes
AFTER INSERT ON Venda
FOR EACH ROW
EXECUTE FUNCTION relatorio_vendas_pendentes();
