namespace JiyuuBot {
    public struct MessageContext {
        ObjectPath connection_path;
        ObjectPath text_channel_path;
        Tp.Message message;

        public async void reply(string text) throws Error {
            Tp.MessageChannel channel = yield Tp.Channel.from_path(
                connection_path, text_channel_path);

            Tp.Message new_message = {new HashTable[2]};
            for (var i = 0; i < 2; i++)
                new_message.parts[i] =
                    new HashTable<string, Variant?>(str_hash, str_equal);
            new_message.parts[1]["content-type"] =
                new Variant("s", "text/plain");
            new_message.parts[1]["content"] = new Variant("s", text.chomp());

            yield channel.send_message(new_message.parts,
                Tp.MessageSendFlags.NONE);
        }

        internal bool is_normal(out string text) {
            text = "";

            if (message.message_type != Tp.MessageType.NORMAL)
                return false;

            var _text = message.to_text();
            if (_text == null)
                return false;

            text = (!) _text;
            return true;
        }
    }
}
