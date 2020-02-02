namespace TstBits {
    class Application : Gtk.Application {
        public Application() {
            Object(
                application_id: "com.github.asifZaman0362.generator",
                flags: ApplicationFlags.FLAGS_NONE
            );
        }

        protected override void activate() {
            var mainWindow              = new Gtk.ApplicationWindow(this);
            mainWindow.default_width    = 800;
            mainWindow.default_height   = 480;
            mainWindow.title            = "Generator";
            var mainLabel               = new Gtk.Label("Add stuff here :)");
            mainWindow.add(mainLabel);
            mainWindow.show_all();
        }

        public static int main(string[] args) {
            var app = new Application();
            return app.run(args);
        }
    }
}
