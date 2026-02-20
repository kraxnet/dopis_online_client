# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.2] - 2026-02-10

### Changed
- **Breaking**: Minimum Ruby version is now 2.7.0
- Updated all dependencies to modern versions
- Replaced Travis CI with GitHub Actions for CI/CD
- Replaced deprecated `fakeweb` with `webmock` for testing
- Removed `turn` gem dependency (incompatible with modern Ruby)
- Removed `rake` and `bundler` as runtime dependencies
- Fixed Rakefile to use modern `RDoc::Task` instead of deprecated `Rake::RDocTask`
- Removed obsolete rcov task from Rakefile
- Added MIT license specification to gemspec
- Added compatibility shim for `httmultiparty` with modern `multipart-post` gem
- All tests now pass on Ruby 2.7, 3.0, 3.1, 3.2, and 3.3

### Added
- GitHub Actions CI workflow
- This CHANGELOG file
- Proper version constraints for all dependencies
- `vendor/bundle` to .gitignore

### Fixed
- Tests now work with modern Ruby versions (3.x)
- Fixed compatibility issues with modern gem versions

## [1.0.1] - 2013-xx-xx

### Changed
- Previous version (details not documented)

[1.0.2]: https://github.com/kraxnet/dopis_online_client/compare/v1.0.1...v1.0.2
[1.0.1]: https://github.com/kraxnet/dopis_online_client/releases/tag/v1.0.1
