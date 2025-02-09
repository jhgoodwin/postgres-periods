# Postgres with Periods Extension

A PostgreSQL container image with the [periods extension](https://github.com/xocolatl/periods) pre-installed. This extension adds SQL:2016 PERIOD and SYSTEM VERSIONING support to PostgreSQL.

This image is based on the official PostgreSQL 17.2 image and includes the periods extension. The image is available for both ARM64 and AMD64 architectures.

## Features

- Based on PostgreSQL 17.2
- Pre-installed periods extension for temporal table support
- Multi-architecture support (ARM64/AMD64)

## What is the Periods Extension?

The periods extension adds support for:
- SQL:2016 PERIOD definitions
- System-versioned temporal tables
- Temporal constraints (WITHOUT OVERLAPS)
- Temporal querying (AS OF, FROM/TO, BETWEEN)

For detailed information about the periods extension capabilities, see the [periods project documentation](https://github.com/xocolatl/periods).

## Usage

```bash
POSTGRES_PASSWORD=your_password_here
docker run -d --name postgres-periods -p 5432:5432 -e POSTGRES_PASSWORD=$POSTGRES_PASSWORD -v postgres-data:/var/lib/postgresql/data jhgoodwin/postgres-periods:17.2
```

## Example Usage

```sql
-- Create a system-versioned table
CREATE TABLE example (
    id bigint PRIMARY KEY,
    value text
);

-- Add system versioning
SELECT periods.add_system_time_period('example', 'row_start', 'row_end');
SELECT periods.add_system_versioning('example');

-- Query historical data
SELECT * FROM example__as_of('2024-01-01');
```

## License

- This container image is licensed under the PostgreSQL License
- The periods extension is licensed under the PostgreSQL License

## Contributing

Issues and pull requests are welcome on the [GitHub repository](https://github.com/jhgoodwin/postgres-periods).

