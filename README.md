# Github Jobs

A very simple api mirror for https://jobs.github.com/positions.json

## Clonning & Installing
`Ruby 2.6.3`
`Rails 5.2.2.1`

```bash
$ git@github.com:gkpacker/github_jobs.git
$ cd github_jobs
$ bundle install
$ bin/rails db:create db:migrate
```

## Loading Jobs

Max n of pages is set to 3. Pagination starts by default at 0.
Stores only the job description and location.
```bash
$ bin/rails console
```
To load jobs until the fourth page
```rb
irb(main):001:0> Loaders::Jobs.new.load!
```
You can filter by city:
```rb
irb(main):001:0> Loaders::Jobs.new(location: 'sp').load!
```

## Starting the server

```bash
$ bin/rails server
```

and open http://localhost:3000/api/v1/jobs to see stored jobs from github jobs

