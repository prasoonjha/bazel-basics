def hello_bazel_impl(ctx):
    output_file = ctx.actions.declare_file(ctx.attr.out_file_name+".txt")
    ctx.actions.run_shell(
        outputs = [output_file],
        command = "cat $1"
        arguments = [ctx.file.my_input_file.path]
    )
    return DefaultInfo(files = depset([output_file]))

hello_bazel = rule(
    implementation = hello_bazel_impl,
    attrs = {
        "my_input_file": attr.label(allow_single_file = True),
        "out_file_name": attr.string()
    }
)