/*
* Copyright (c) 2011-2018 Asif Zaman
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*
* Authored by: Asif Zaman <zero362001@gmail.com>
*/


namespace TstBits {
    class Application : Gtk.Application {
        
        Gtk.Label number_label;
        Gtk.Entry range_start_input;
        Gtk.Entry range_end_input;

        public Application() {
            Object(
                application_id: "com.github.asifZaman0362.generator",
                flags:          ApplicationFlags.FLAGS_NONE
            );
        }

        protected override void activate() {
            var main_window = new Gtk.ApplicationWindow(this);
            main_window.default_height = 200;
            main_window.default_width  = 400;
            main_window.title = "Generator";
            
            var main_box = new Gtk.Box(Gtk.Orientation.VERTICAL, 0);
            
            number_label = new Gtk.Label("Random Number");
            number_label.margin = 12;

            range_start_input = new Gtk.Entry();
            range_end_input = new Gtk.Entry();
            range_start_input.max_width_chars = 24;
            range_end_input.max_width_chars = 24;
            range_start_input.margin = 12;
            range_end_input.margin = 12;
            range_start_input.placeholder_text = "Range Min = 0 (default)";
            range_end_input.placeholder_text = "Range Max = 999999 (default)";
            
            var random_gen_button = new Gtk.Button.with_label("Generate");
            random_gen_button.margin = 12;
            random_gen_button.clicked.connect(() => set_random_number());
            
            main_box.add(number_label);
            main_box.add(range_start_input);
            main_box.add(range_end_input);
            main_box.add(random_gen_button);
            
            main_window.add(main_box);
            main_window.show_all();
        }

        public static int main(string[] args) {
            var app = new Application();
            return app.run(args);
        }

        public void set_random_number() {
            int start, end;
            string input_min = range_start_input.get_text();
            string input_max = range_end_input.get_text();
            
            if (input_min == null || input_min == "")
                start = 0;
            else start = int.parse(input_min);
            if (input_max == null || input_max == "")
                end = 999999;
            else end = int.parse(input_max);
            
            int num = GLib.Random.int_range(start, end);
            number_label.set_label(num.to_string());
        }
    }
}