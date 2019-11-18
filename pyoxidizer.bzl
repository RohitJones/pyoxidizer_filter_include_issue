build_config = BuildConfig(application_name="filter_test")

embedded_python_config = EmbeddedPythonConfig(
    write_modules_directory_env = "PYOXIDIZER_MODULES_DIR"
)

packaging_rules = [
    StdlibExtensionsPolicy("all"),
    Stdlib(include_source=False),
    PackageRoot(path="./py_src/", packages=["test_package"]),
    FilterInclude(glob_files=["dump-modules/modules-*"])
]


python_run_mode = python_run_mode_module("test_package.__main__")

Config(
    build_config=build_config,
    embedded_python_config=embedded_python_config,
    python_distribution=default_python_distribution(),
    python_run_mode=python_run_mode,
    packaging_rules=packaging_rules,
)

PYOXIDIZER_VERSION = "0.5.0"
PYOXIDIZER_COMMIT = "35a70354ba4e0e24e632f0427a7ebf0cb1c56344"
