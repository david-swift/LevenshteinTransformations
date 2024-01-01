docs:
	@sourcedocs generate --min-acl private -r --spm-module LevenshteinTransformations

swiftlint:
	@swiftlint --autocorrect
