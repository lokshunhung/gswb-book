""""""

_ATTRS = {
    "srcs": attr.label_list(
        allow_files = True,
    ),
    "_jdk": attr.label(
        default = Label("@bazel_tools//tools/jdk:current_java_runtime"),
        providers = [java_common.JavaRuntimeInfo],
    ),
}

def _impl(ctx):
    zip_input = ctx.label.name
    zip_output = ctx.outputs.zip
    java_home = str(ctx.attr._jdk[java_common.JavaRuntimeInfo].java_home)
    src_list = [src.path for src in ctx.files.srcs]
    cmd = [
        "mkdir %s" % zip_input,
        "%s/bin/javadoc -quiet -d %s %s" % (java_home, zip_input, " ".join(src_list)),
        "zip -q -r %s %s/*" % (zip_output.path, zip_input),
    ]
    ctx.actions.run_shell(
        inputs = ctx.files.srcs + ctx.files._jdk,
        outputs = [zip_output],
        command = "\n".join(cmd),
    )

javadoc = rule(
    attrs = _ATTRS,
    implementation = _impl,
    outputs = {
        "zip": "%{name}.zip",
    },
)
