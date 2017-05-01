# -*- mode: python; -*-
#
# Copyright 2016 The Closure Rules Authors. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""External dependencies for Closure Rules."""

load("//closure/private:platform_http_file.bzl", "platform_http_file")

def closure_repositories(
    omit_aopalliance=False,
    omit_args4j=False,
    omit_asm=False,
    omit_asm_analysis=False,
    omit_asm_commons=False,
    omit_asm_util=False,
    omit_clang=False,
    omit_closure_compiler=False,
    omit_closure_library=False,
    omit_closure_stylesheets=False,
    omit_errorprone=False,
    omit_fonts_noto_hinted_deb=False,
    omit_fonts_noto_mono_deb=False,
    omit_gson=False,
    omit_guava=False,
    omit_guice=False,
    omit_guice_assistedinject=False,
    omit_guice_multibindings=False,
    omit_icu4j=False,
    omit_incremental_dom=False,
    omit_json=False,
    omit_jsr305=False,
    omit_jsr330_inject=False,
    omit_libexpat_amd64_deb=False,
    omit_libfontconfig_amd64_deb=False,
    omit_libfreetype_amd64_deb=False,
    omit_libpng_amd64_deb=False,
    omit_phantomjs=False,
    omit_protobuf_java=False,
    omit_protobuf_js=False,
    omit_protoc_linux_x86_64=False,
    omit_protoc_macosx=False,
    omit_safe_html_types=False,
    omit_safe_html_types_html_proto=False,
    omit_soy=False,
    omit_soy_jssrc=False):
  closure_maven_server()
  if not omit_aopalliance:
    aopalliance()
  if not omit_args4j:
    args4j()
  if not omit_asm:
    asm()
  if not omit_asm_analysis:
    asm_analysis()
  if not omit_asm_commons:
    asm_commons()
  if not omit_asm_util:
    asm_util()
  if not omit_clang:
    clang()
  if not omit_closure_compiler:
    closure_compiler()
  if not omit_closure_library:
    closure_library()
  if not omit_closure_stylesheets:
    closure_stylesheets()
  if not omit_errorprone:
    errorprone()
  if not omit_fonts_noto_hinted_deb:
    fonts_noto_hinted_deb()
  if not omit_fonts_noto_mono_deb:
    fonts_noto_mono_deb()
  if not omit_gson:
    gson()
  if not omit_guava:
    guava()
  if not omit_guice:
    guice()
  if not omit_guice_assistedinject:
    guice_assistedinject()
  if not omit_guice_multibindings:
    guice_multibindings()
  if not omit_icu4j:
    icu4j()
  if not omit_incremental_dom:
    incremental_dom()
  if not omit_json:
    json()
  if not omit_jsr305:
    jsr305()
  if not omit_jsr330_inject:
    jsr330_inject()
  if not omit_libexpat_amd64_deb:
    libexpat_amd64_deb()
  if not omit_libfontconfig_amd64_deb:
    libfontconfig_amd64_deb()
  if not omit_libfreetype_amd64_deb:
    libfreetype_amd64_deb()
  if not omit_libpng_amd64_deb:
    libpng_amd64_deb()
  if not omit_phantomjs:
    phantomjs()
  if not omit_protobuf_java:
    protobuf_java()
  if not omit_protobuf_js:
    protobuf_js()
  if not omit_protoc_linux_x86_64:
    protoc_linux_x86_64()
  if not omit_protoc_macosx:
    protoc_macosx()
  if not omit_safe_html_types:
    safe_html_types()
  if not omit_safe_html_types_html_proto:
    safe_html_types_html_proto()
  if not omit_soy:
    soy()
  if not omit_soy_jssrc:
    soy_jssrc()

# MAINTAINERS
#
# 1. Please sort everything in this file.
#
# 2. Every external rule must have a SHA checksum.
#
# 3. Use http:// URLs since we're relying on the checksum for security.
#
# 4. Files must be mirrored to servers operated by Google SREs. This minimizes
#    the points of failure. It also minimizes the probability failure. For
#    example, if we assumed all external download servers were equal, had 99.9%
#    availability, and uniformly distributed downtime, that would put the
#    probability of an install working at 97.0% (0.999^30). Google static
#    content servers should have 99.999% availability, which *in theory* means
#    Closure Rules will install without any requests failing 99.9% of the time.
#
#    To get files mirrored, email the new artifacts or URLs to jart@google.com
#    so she can run:
#
#      bzmirror() {
#        local url="${1:?url}"
#        if [[ "${url}" =~ ^([^:]+):([^:]+):([^:]+)$ ]]; then
#          url="http://repo1.maven.org/maven2/${BASH_REMATCH[1]//.//}/${BASH_REMATCH[2]}/${BASH_REMATCH[3]}/${BASH_REMATCH[2]}-${BASH_REMATCH[3]}.jar"
#        fi
#        local dest="gs://bazel-mirror/${url#http*//}"
#        local desturl="http://bazel-mirror.storage.googleapis.com/${url#http*//}"
#        local name="$(basename "${dest}")"
#        wget -O "/tmp/${name}" "${url}" || return 1
#        gsutil cp -a public-read "/tmp/${name}" "${dest}" || return 1
#        gsutil setmeta -h 'Cache-Control:public, max-age=31536000' "${dest}" || return 1
#        rm "/tmp/${name}" || return 1
#        curl -I "${desturl}"
#        echo
#        echo "${desturl}"
#      }

def aopalliance():
  native.maven_jar(
      name = "aopalliance",
      artifact = "aopalliance:aopalliance:1.0",
      sha1 = "0235ba8b489512805ac13a8f9ea77a1ca5ebe3e8",
      server = "closure_maven_server",
  )

def args4j():
  native.maven_jar(
      name = "args4j",
      artifact = "args4j:args4j:2.0.26",
      sha1 = "01ebb18ebb3b379a74207d5af4ea7c8338ebd78b",
      server = "closure_maven_server",
  )

def asm():
  native.maven_jar(
      name = "asm",
      artifact = "org.ow2.asm:asm:5.0.3",
      sha1 = "dcc2193db20e19e1feca8b1240dbbc4e190824fa",
      server = "closure_maven_server",
  )

def asm_analysis():
  native.maven_jar(
      name = "asm_analysis",
      artifact = "org.ow2.asm:asm-analysis:5.0.3",
      sha1 = "c7126aded0e8e13fed5f913559a0dd7b770a10f3",
      server = "closure_maven_server",
  )

def asm_commons():
  native.maven_jar(
      name = "asm_commons",
      artifact = "org.ow2.asm:asm-commons:5.0.3",
      sha1 = "a7111830132c7f87d08fe48cb0ca07630f8cb91c",
      server = "closure_maven_server",
  )

def asm_util():
  native.maven_jar(
      name = "asm_util",
      artifact = "org.ow2.asm:asm-util:5.0.3",
      sha1 = "1512e5571325854b05fb1efce1db75fcced54389",
      server = "closure_maven_server",
  )

def clang():
  platform_http_file(
      name = "clang",
      amd64_url = "http://bazel-mirror.storage.googleapis.com/llvm.org/releases/3.8.0/clang+llvm-3.8.0-x86_64-linux-gnu-ubuntu-14.04.tar.xz",
      amd64_sha256 = "3120c3055ea78bbbb6848510a2af70c68538b990cb0545bac8dad01df8ff69d7",
      macos_url = "http://bazel-mirror.storage.googleapis.com/llvm.org/releases/3.8.0/clang+llvm-3.8.0-x86_64-apple-darwin.tar.xz",
      macos_sha256 = "e5a961e04b0e1738bbb5b824886a34932dc13b0af699d1fe16519d814d7b776f",
  )

def closure_compiler():
  native.maven_jar(
      name = "closure_compiler",
      artifact = "com.google.javascript:closure-compiler-unshaded:v20170423",
      sha1 = "bdda73d7e2bd001913d4563a12ded21179ccec9f",
      server = "closure_maven_server",
  )

def closure_library():
  # To update Closure Library, one needs to uncomment and run the
  # js_library_files_maker and js_testing_files_maker genrules in
  # closure_library.BUILD.
  native.new_http_archive(
      name = "closure_library",
      url = "http://bazel-mirror.storage.googleapis.com/github.com/google/closure-library/archive/0e309e9c5fb611a70a47736a2eb1204ae48ab989.tar.gz",
      sha256 = "08b34d8efe3026f106c1ae2901a2cd1c7106be0c4173681c1fc57415e8532be9",
      strip_prefix = "closure-library-0e309e9c5fb611a70a47736a2eb1204ae48ab989",
      build_file = str(Label("//closure/library:closure_library.BUILD")),
  )

def closure_maven_server():
  native.maven_server(
      name = "closure_maven_server",
      url = "http://bazel-mirror.storage.googleapis.com/repo1.maven.org/maven2/",
  )

def closure_stylesheets():
  native.maven_jar(
      name = "closure_stylesheets",
      artifact = "com.google.closure-stylesheets:closure-stylesheets:1.4.0",
      sha1 = "ae6a43ac97312c74328b5b2e9135e5126b286fa3",
      server = "closure_maven_server",
  )

def errorprone():
  native.maven_jar(
      name = "errorprone",
      artifact = "com.google.errorprone:error_prone_annotations:2.0.15",
      sha1 = "822652ed7196d119b35d2e22eb9cd4ffda11e640",
      server = "closure_maven_server",
  )

def fonts_noto_hinted_deb():
  native.http_file(
      name = "fonts_noto_hinted_deb",
      url = "http://bazel-mirror.storage.googleapis.com/http.us.debian.org/debian/pool/main/f/fonts-noto/fonts-noto-hinted_20160116-1_all.deb",
      sha256 = "25b362c9437a7859ce034f22d94b698e8ed25007b443e5a26228ed5b3d2d32d4",
  )

def fonts_noto_mono_deb():
  native.http_file(
      name = "fonts_noto_mono_deb",
      url = "http://bazel-mirror.storage.googleapis.com/http.us.debian.org/debian/pool/main/f/fonts-noto/fonts-noto-mono_20160116-1_all.deb",
      sha256 = "74b457715f275ed893998a70d6bc955f67da6d36b36b422dbeeb045160edacb6",
  )

def gson():
  native.maven_jar(
      name = "gson",
      artifact = "com.google.code.gson:gson:2.7",
      sha1 = "751f548c85fa49f330cecbb1875893f971b33c4e",
      server = "closure_maven_server",
  )

def guava():
  native.maven_jar(
      name = "guava",
      artifact = "com.google.guava:guava:20.0",
      sha1 = "89507701249388e1ed5ddcf8c41f4ce1be7831ef",
      server = "closure_maven_server",
  )

def guice():
  native.maven_jar(
      name = "guice",
      artifact = "com.google.inject:guice:4.1.0",
      sha1 = "eeb69005da379a10071aa4948c48d89250febb07",
      server = "closure_maven_server",
  )

def guice_assistedinject():
  native.maven_jar(
      name = "guice_assistedinject",
      artifact = "com.google.inject.extensions:guice-assistedinject:4.1.0",
      sha1 = "af799dd7e23e6fe8c988da12314582072b07edcb",
      server = "closure_maven_server",
  )

def guice_multibindings():
  native.maven_jar(
      name = "guice_multibindings",
      artifact = "com.google.inject.extensions:guice-multibindings:4.1.0",
      sha1 = "3b27257997ac51b0f8d19676f1ea170427e86d51",
      server = "closure_maven_server",
  )

def icu4j():
  native.maven_jar(
      name = "icu4j",
      artifact = "com.ibm.icu:icu4j:57.1",
      sha1 = "198ea005f41219f038f4291f0b0e9f3259730e92",
      server = "closure_maven_server",
  )

def incremental_dom():
  # To update Incremental DOM, one needs to update
  # third_party/incremental_dom/build.sh to remain compatible with the
  # upstream "js-closure" gulpfile.js target.
  # https://github.com/google/incremental-dom/blob/master/gulpfile.js
  native.http_file(
      name = "incremental_dom",
      url = "http://bazel-mirror.storage.googleapis.com/github.com/google/incremental-dom/archive/0.5.2.tar.gz",
      sha256 = "554a778dff5cba561a98619b2f3de5061848744644c870f718e2cdcf9bf0dccf",
  )

def json():
  native.maven_jar(
      name = "json",
      artifact = "org.json:json:20160212",
      sha1 = "a742e3f85161835b95877478c5dd5b405cefaab9",
      server = "closure_maven_server",
  )

def jsr305():
  native.maven_jar(
      name = "jsr305",
      artifact = "com.google.code.findbugs:jsr305:2.0.3",
      sha1 = "5871fb60dc68d67da54a663c3fd636a10a532948",
      server = "closure_maven_server",
  )

def jsr330_inject():
  native.maven_jar(
      name = "jsr330_inject",
      artifact = "javax.inject:javax.inject:1",
      sha1 = "6975da39a7040257bd51d21a231b76c915872d38",
      server = "closure_maven_server",
  )

def libexpat_amd64_deb():
  native.http_file(
      name = "libexpat_amd64_deb",
      url = "http://bazel-mirror.storage.googleapis.com/http.us.debian.org/debian/pool/main/e/expat/libexpat1_2.1.0-6+deb8u1_amd64.deb",
      sha256 = "1b006e659f383e09909595d8b84b79828debd7323d00e8a28b72ccd902273861",
  )

def libfontconfig_amd64_deb():
  native.http_file(
      name = "libfontconfig_amd64_deb",
      url = "http://bazel-mirror.storage.googleapis.com/http.us.debian.org/debian/pool/main/f/fontconfig/libfontconfig1_2.11.0-6.3_amd64.deb",
      sha256 = "2b21f91c8b46caba41221f1e45c5a37cac08ce1298dd7a28442f1b7332fa211b",
  )

def libfreetype_amd64_deb():
  native.http_file(
      name = "libfreetype_amd64_deb",
      url = "http://bazel-mirror.storage.googleapis.com/http.us.debian.org/debian/pool/main/f/freetype/libfreetype6_2.5.2-3+deb8u1_amd64.deb",
      sha256 = "80184d932f9b0acc130af081c60a2da114c7b1e7531c18c63174498fae47d862",
  )

def libpng_amd64_deb():
  native.http_file(
      name = "libpng_amd64_deb",
      url = "http://bazel-mirror.storage.googleapis.com/http.us.debian.org/debian/pool/main/libp/libpng/libpng12-0_1.2.50-2+deb8u2_amd64.deb",
      sha256 = "a57b6d53169c67a7754719f4b742c96554a18f931ca5b9e0408fb6502bb77e80",
  )

def phantomjs():
  platform_http_file(
      name = "phantomjs",
      amd64_url = "http://bazel-mirror.storage.googleapis.com/bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2",
      amd64_sha256 = "86dd9a4bf4aee45f1a84c9f61cf1947c1d6dce9b9e8d2a907105da7852460d2f",
      macos_url = "http://bazel-mirror.storage.googleapis.com/bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-macosx.zip",
      macos_sha256 = "538cf488219ab27e309eafc629e2bcee9976990fe90b1ec334f541779150f8c1",
)

def protobuf_java():
  native.maven_jar(
      name = "protobuf_java",
      artifact = "com.google.protobuf:protobuf-java:3.2.0",
      sha1 = "62ccf171a106ff6791507f2d5364c275f9a3131d",
      server = "closure_maven_server",
  )

def protobuf_js():
  native.new_http_archive(
      name = "protobuf_js",
      url = "http://bazel-mirror.storage.googleapis.com/github.com/google/protobuf/releases/download/v3.2.0/protobuf-js-3.2.0.zip",
      sha256 = "6385372e081bfb89a904944af1fae02542fefa9db86709f08c86ac0ee14c5651",
      strip_prefix = "protobuf-3.2.0",
      build_file = str(Label("//closure/protobuf:protobuf_js.BUILD")),
  )

def protoc_linux_x86_64():
  native.http_file(
      name = "protoc_linux_x86_64",
      url = "http://bazel-mirror.storage.googleapis.com/github.com/google/protobuf/releases/download/v3.2.0/protoc-3.2.0-linux-x86_64.zip",
      sha256 = "9cf9a8661d649b8477fe0ad32a8b28d351a170a62e210bf848d90a29f1f4df9d",
  )

def protoc_macosx():
  native.http_file(
      name = "protoc_macosx",
      url = "http://bazel-mirror.storage.googleapis.com/github.com/google/protobuf/releases/download/v3.2.0/protoc-3.2.0-osx-x86_64.zip",
      sha256 = "69fbd04599c53af7826f9a6cf2a34f15aec6e0800c24cd572f4f5ba9e156a2cb",
  )

def safe_html_types():
  native.maven_jar(
      name = "safe_html_types",
      artifact = "com.google.common.html.types:types:1.0.5",
      sha1 = "cbf72feac4a1599add33222a876e24ab31a3f387",
      server = "closure_maven_server",
  )

def safe_html_types_html_proto():
  native.http_file(
      name = "safe_html_types_html_proto",
      sha256 = "6ece202f11574e37d0c31d9cf2e9e11a0dbc9218766d50d211059ebd495b49c3",
      url = "http://bazel-mirror.storage.googleapis.com/raw.githubusercontent.com/google/safe-html-types/release-1.0.5/proto/src/main/protobuf/webutil/html/types/proto/html.proto",
  )

def soy():
  native.maven_jar(
      name = "soy",
      artifact = "com.google.template:soy:2017-04-23",
      sha1 = "52f32a5a3801ab97e0909373ef7f73a3460d0802",
      server = "closure_maven_server",
  )

def soy_jssrc():
  native.new_http_archive(
      name = "soy_jssrc",
      sha256 = "ed0be8195f5a05eea82099d234dab074ca80d7c1f2e54928e0fb2ee0a7ba666d",
      url = "http://bazel-mirror.storage.googleapis.com/repo1.maven.org/maven2/com/google/template/soy/2017-02-01/soy-2017-02-01-jssrc_js.jar",
      build_file = str(Label("//closure/templates:soy_jssrc.BUILD")),
      type = "zip",
  )
