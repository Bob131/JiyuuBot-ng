import gi
from gi.repository import GObject
gi.require_version('JiyuuBot', '1.0')
from gi.repository import JiyuuBot


class bots(JiyuuBot.PluginsBasePlugin):
    def do_should_exec(self, msg):
        return msg.command('bots')

    def do_exec(self, msg):
        msg.send('Reporting in! [Vala]')
