from unittest import TestCase
from fastapi.testclient import TestClient
from test_fastapi_github.app.application import create_application


class TestBaseEventHandler(TestCase):
    def test_startup_handler(self):
        app = create_application()
        with self.assertLogs('test_fastapi_github', level='INFO') as cm:

            with TestClient(app):
                pass
            self.assertEqual(cm.output,
                             ['INFO:test_fastapi_github:Starting up ...',
                              'INFO:test_fastapi_github:Shutting down ...'])
