{ lib
, buildPythonPackage
, fetchPypi
, requests
, setuptools
}:

buildPythonPackage rec {
  pname = "zephyr-python-api";
  version = "0.0.4";
  format = "pyproject";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-GIXxpItbRH31PJ7dX48w92LrYY0axbZQoAFXrRGeLas=";
  };

  nativeBuildInputs = [ setuptools ];

  propagatedBuildInputs = [
    requests
  ];

  # No tests in archive
  doCheck = false;

  pythonImportsCheck = [ "zephyr" ];

  meta = {
    homepage = "https://github.com/nassauwinter/zephyr-python-api";
    description = "A set of wrappers for Zephyr Scale (TM4J) REST API";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ rapiteanu ];
  };
}
