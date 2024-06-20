const std = @import("std");
const stdin = std.io.getStdIn().reader();
const stdout = std.io.getStdOut().writer();

fn ask_user() !?i64 {
    var buf: [1000]u8 = undefined;

    if (try stdin.readUntilDelimiterOrEof(buf[0..], '\n')) |user_input| {
        return std.fmt.parseInt(i64, user_input, 10) catch |err| switch (err) {
            error.Overflow => {
                try stdout.writeAll("Moc velké číslo!\nJsi kokot!\n");
                return null;
            },
            error.InvalidCharacter => {
                try stdout.writeAll("Jsi kokot!\n");
                return null;
            },
        };
    } else {
        return @as(i64, 0);
    }
}

pub fn main() !void {
    var rohliky: i64 = 0;
    var penize: i64 = 0;

    var run: bool = true;
    while (run) {
        try stdout.writeAll("Kolik rohlíků: ");
        rohliky = try ask_user() orelse continue;

        var run2: bool = true;
        while (run2) {
            try stdout.writeAll("Kolik zaplatíš: ");
            penize = try ask_user() orelse continue;
            if (penize >= rohliky * 3) {
                try stdout.print("{any}\n", .{rohliky});
                run = false;
                break;
            }
            while (true) {
                var buf: [1000]u8 = undefined;
                try stdout.writeAll("To nestačí, zaplať víc! Z = Znovu, C = Změnit cenu, E = Exit: ");

                if (try stdin.readUntilDelimiterOrEof(buf[0..], '\n')) |user_input| {
                    if (std.mem.eql(u8, user_input, "Z") or std.mem.eql(u8, user_input, "z")) {
                        run2 = false;
                        break;
                    } else if (std.mem.eql(u8, user_input, "C") or std.mem.eql(u8, user_input, "c")) {
                        break;
                    } else if (std.mem.eql(u8, user_input, "E") or std.mem.eql(u8, user_input, "e")) {
                        run = false;
                        run2 = false;
                        break;
                    } else {
                        try stdout.writeAll("Jsi kokot!\n");
                        continue;
                    }
                }
            }
        }
    }
}
