import pytest
from fastapi.testclient import TestClient
from test_fastapi_github.app.application import create_application
@pytest.fixture
def test_client():
    app = create_application()
    test_client = TestClient(app)
    return test_client


