# therealyou-api

![CI](https://github.com/KyliannIvory/therealyou-api/actions/workflows/ci.yml/badge.svg?branch=main)

> Booking engine and management platform for hair salons and barbershops in Côte d'Ivoire.

Backend of **TheRealYou**, built as a **modular monolith** with Spring Modulith.
The web app lives in [therealyou-web](https://github.com/KyliannIvory/therealyou-web).

> 🚧 **Status:** work in progress. See the [roadmap](#roadmap) and the
> [project board](https://github.com/users/KyliannIvory/projects/TODO).

## Features

- **Online booking:** clients find a salon and book a slot in a few clicks
- **Slot scheduling:** real-time availability, variable service durations,
  double-booking prevention enforced at database level
- **Salon catalog:** salon profiles, services and portfolio
- **Automated reminders:** notifications to reduce no-shows
- **Event-driven modules:** strict module boundaries, communication through
  Spring application events

## Tech stack

| Layer        | Technology                                  |
|--------------|---------------------------------------------|
| Language     | Java 25 (LTS)                               |
| Framework    | Spring Boot 4.1, Spring Modulith 2.1        |
| Database     | PostgreSQL 18                               |
| Persistence  | Spring Data JPA, Flyway                     |
| Tests        | JUnit 5, Testcontainers                     |
| Build        | Maven (wrapper included)                    |
| CI           | GitHub Actions                              |
| Containers   | Docker, Docker Compose                      |

## Architecture

The code is split into modules, one package each under `com.therealyou`.
Only the root package of a module is public. Everything in `internal/` is private.

| Module         | Responsibility                           |
|----------------|------------------------------------------|
| `identity`     | Accounts, authentication                 |
| `salon`        | Salons, services, opening hours          |
| `booking`      | Slots, availability, appointments        |
| `notification` | SMS / WhatsApp reminders                 |

Modules talk to each other in two ways:
- a direct call to the other module's public API, when an answer is needed now
- an application event, when other modules just need to react

Boundaries are verified by an automated test (`ApplicationModules.verify()`).

## Getting started

### Prerequisites

- Java 25 (Temurin recommended)
- Docker (PostgreSQL is started automatically)

### Run locally

```bash
git clone git@github.com:KyliannIvory/therealyou-api.git
cd therealyou-api

cp .env.example .env     # then adjust the values if needed
./mvnw spring-boot:run
```

Spring Boot starts the PostgreSQL container from `compose.yaml` for you
(Docker Compose support) and runs the Flyway migrations.

The API is available on http://localhost:8080.
Health check: http://localhost:8080/actuator/health

### Run the tests

```bash
./mvnw verify
```

Integration tests use Testcontainers, so Docker must be running.

## Configuration

Environment variables are read from `.env` (never committed).
See `.env.example` for the full list.

| Variable            | Description               |
|---------------------|---------------------------|
| `POSTGRES_DB`       | Database name             |
| `POSTGRES_USER`     | Database user             |
| `POSTGRES_PASSWORD` | Database password         |
| `POSTGRES_PORT`     | Port exposed on the host  |

## Project structure

```
src/main/java/com/therealyou/
├── identity/
├── salon/
│   └── internal/
├── booking/
│   ├── internal/
│   └── web/
└── notification/
    └── internal/
src/main/resources/
└── db/migration/        # Flyway migrations
```

## Workflow

- `main` is protected: no direct push, changes go through pull requests
- Every change starts from an issue and a branch (`feat/12-booking-create`)
- Squash merge only, PR titles follow [Conventional Commits](https://www.conventionalcommits.org/)
- CI must be green before merging

