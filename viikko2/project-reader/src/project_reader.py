from urllib import request
from project import Project
import toml


class ProjectReader:
    def __init__(self, url):
        self._url = url

    def get_project(self):
        # tiedoston merkkijonomuotoinen sisältö
        content = request.urlopen(self._url).read().decode("utf-8")
        #print(content)
        dict_content = toml.loads(content)
        #print(dict_content)

        # deserialisoi TOML-formaatissa oleva merkkijono ja muodosta Project-olio sen tietojen perusteella
        return Project(dict_content["tool"]["poetry"]["name"], "Test description", [], [])
    

class Project:
    def __init__(self,name:str, desc:str, deps:list, devdeps:list):
        self.name = name
        self.desc = desc
        self.deps = deps
        self.devdeps = devdeps
