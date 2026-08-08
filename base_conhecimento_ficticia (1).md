# Base de Conhecimento — ABC Telecom

> **Documento fictício.** Empresa, planos, valores, prazos e políticas foram inventados para demonstrar a arquitetura de RAG deste projeto. Não correspondem a nenhuma empresa real.

---

## A empresa

A ABC Telecom é uma consultoria B2B de telecomunicações e TI que atende empresas de pequeno, médio e grande porte. Atua como parceira credenciada de uma operadora nacional, intermediando contratação de planos empresariais, portabilidade de linhas e suporte continuado.

Carteira aproximada: 43 mil clientes empresariais.

---

## Planos empresariais

### Plano Essencial

Para empresas com até 10 linhas. Internet móvel de 20GB por linha, ligações ilimitadas dentro da rede da operadora, SLA de resposta em até 24 horas. Valor de referência: R$ 89,90 por linha/mês.

### Plano Corporativo

Para empresas com 11 a 50 linhas. Internet móvel de 50GB por linha, roaming internacional incluso na América Latina, SLA de resposta em até 8 horas. Valor de referência: R$ 129,90 por linha/mês.

### Plano Platinum

Para empresas com mais de 50 linhas. Internet móvel de 100GB por linha, roaming internacional global, gerente de conta dedicado, SLA de resposta em até 4 horas. Valor de referência: R$ 179,90 por linha/mês.

Contratos acima de 200 linhas são negociados caso a caso com a mesa comercial.

---

## SLA por tier de contrato

| Tier | SLA de resposta | Atendimento |
|---|---|---|
| Essencial | 24 horas | Suporte técnico N1 |
| Corporativo | 8 horas | Suporte técnico N1, escala para N2 |
| Platinum | 4 horas | Suporte técnico N2 e gerente de conta dedicado |

Chamados classificados como críticos — operação totalmente parada — pulam a triagem N1 independentemente do tier e são atendidos em até 2 horas.

O SLA conta em horas úteis, de segunda a sexta, das 8h às 18h. Clientes Platinum têm SLA em horas corridas, incluindo fins de semana.

---

## Política de portabilidade

### Documentos exigidos

- Contrato social ou certificado MEI da empresa
- Documento de identificação do representante legal
- Última fatura da operadora de origem
- Relação das linhas a serem portadas, com os números completos
- Comprovante de titularidade das linhas junto à operadora de origem

### Etapas do processo

1. **Coleta e conferência documental.** A ABC valida se a titularidade das linhas corresponde ao CNPJ contratante. Divergência aqui é a causa mais comum de recusa.
2. **Solicitação formal de portabilidade.** Protocolo aberto junto à operadora receptora, com prazo de análise de 2 dias úteis.
3. **Janela de migração.** Após aprovação, a migração é agendada em uma janela de 3 a 5 dias úteis. A empresa é informada da data com no mínimo 24 horas de antecedência.
4. **Migração efetiva.** A troca ocorre em janela de madrugada, entre 0h e 6h. A indisponibilidade estimada é de até 3 horas por linha.
5. **Validação pós-migração.** A ABC confirma o funcionamento de todas as linhas em até 24 horas após a janela.

Prazo total estimado: 7 a 12 dias úteis da entrega da documentação completa até a validação final.

### Condições e impedimentos

- Faturas em aberto na operadora de origem bloqueiam a portabilidade. É necessário quitar antes de abrir o protocolo.
- Linhas em período de fidelidade podem gerar multa rescisória cobrada pela operadora de origem. A ABC não tem controle sobre esse valor e não o intermedia.
- A numeração é preservada integralmente. Nenhum número é perdido no processo.
- Portabilidade acima de 50 linhas exige aprovação da mesa comercial e pode ter janela estendida.
- Divergência de titularidade precisa ser resolvida diretamente com a operadora de origem antes do protocolo.

---

## Cobertura e atendimento

Atendimento comercial de segunda a sexta, das 8h às 18h. Suporte técnico N1 em horário comercial; N2 em regime estendido para clientes Corporativo e Platinum.

A cobertura de rede segue a da operadora parceira. Consultas de cobertura em endereço específico são feitas pelo consultor comercial durante a proposta.
