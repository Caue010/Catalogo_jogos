# Plano de Gerência de Configuração de Software (GCS)

**Projeto:** Catálogo de Jogos (Flutter)
**Repositório:** https://github.com/Caue010/Catalogo_jogos
**Responsável:** Caue Yohan Plachi
**Par de revisão:** @USUARIO_DO_REVISOR
**Versão do plano:** 1.0

## 1. Objetivo

Definir como os itens de configuração do projeto são identificados, versionados, alterados, revisados e liberados, garantindo rastreabilidade e que nenhuma mudança chegue à `main` sem revisão.

## 2. Itens de configuração (ICs)

| IC | Caminho | Descrição |
|----|---------|-----------|
| Código-fonte | `lib/` | Código Dart/Flutter da aplicação |
| Configuração de plataforma | `android/` | Projeto Android gerado pelo Flutter |
| Dependências | `pubspec.yaml` | Dependências e metadados do app |
| Documentação | `README.md`, `GCS_PLAN.md` | Instruções de uso e este plano |
| Pipeline | `.github/workflows/` | Automação de CI e liberação |
| Regras do repositório | Configurações do GitHub (ruleset/branch protection) | Proteção da `main` e environments |

## 3. Estrutura do repositório

```
Catalogo_jogos/
├── .github/workflows/ci.yml
├── android/
├── lib/
├── GCS_PLAN.md
├── README.md
└── pubspec.yaml
```

## 4. Estratégia de branches

- `main`: sempre estável; protegida, sem push direto.
- `feature/<descricao-curta>`: novas funcionalidades.
- `fix/<descricao-curta>`: correções.
- `docs/<descricao-curta>`: mudanças de documentação.

## 5. Convenção de commits

Formato `tipo: descrição curta`, com tipos `feat`, `fix`, `docs`, `refactor`, `test`, `chore`.

## 6. Fluxo de mudança

1. Criar branch a partir da `main`.
2. Commits pequenos e descritivos.
3. Abrir Pull Request para `main`.
4. CI executa `flutter analyze` e `flutter test`.
5. Par de revisão aprova o PR.
6. Merge na `main` (squash ou merge commit).
7. Liberação para `staging` automática; `production` exige aprovação do revisor obrigatório.

## 7. Proteção da `main`

- Pull Request obrigatório antes do merge.
- Mínimo de 1 aprovação.
- Verificações de status obrigatórias (CI) antes do merge.
- Push direto bloqueado, inclusive para administradores.
- Force push e exclusão da branch bloqueados.

## 8. Revisão de código

- Par de revisão: @USUARIO_DO_REVISOR, com acesso de escrita ao repositório.
- Critérios: o código compila, passa nos testes, segue a convenção de commits e não quebra o que já existe.

## 9. Ambientes

| Environment | Uso | Aprovação |
|-------------|-----|-----------|
| `staging` | Validação antes da liberação | Nenhuma |
| `production` | Versão liberada | Revisor obrigatório: Caue010 |

## 10. Versionamento e baselines

- Versionamento semântico (`MAJOR.MINOR.PATCH`), conforme `version` do `pubspec.yaml`.
- Cada liberação em `production` recebe uma tag `vX.Y.Z` na `main`.

## 11. Auditoria

O histórico de commits, os Pull Requests, os logs do GitHub Actions e as aprovações de environment servem de registro de auditoria.
