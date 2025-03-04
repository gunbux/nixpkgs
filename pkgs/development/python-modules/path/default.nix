{
  lib,
  buildPythonPackage,
  fetchPypi,
  more-itertools,
  pytestCheckHook,
  pythonOlder,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "path";
  version = "17.1.0";
  pyproject = true;

  disabled = pythonOlder "3.7";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-1B4F7U+h1PbXAt88HgoaJV17VEKHQyRWRV3HxR5fmOk=";
  };

  nativeBuildInputs = [
    setuptools
    setuptools-scm
  ];

  nativeCheckInputs = [
    more-itertools
    pytestCheckHook
  ];

  disabledTests = [
    # creates a file, checks when it was last accessed/modified
    # AssertionError: assert 1650036414.0 == 1650036414.960688
    "test_utime"
  ];

  pythonImportsCheck = [ "path" ];

  meta = with lib; {
    description = "Object-oriented file system path manipulation";
    homepage = "https://github.com/jaraco/path";
    changelog = "https://github.com/jaraco/path/blob/v${version}/NEWS.rst";
    license = licenses.mit;
    maintainers = [ ];
  };
}
