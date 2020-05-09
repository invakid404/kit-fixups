# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit bash-completion-r1

MY_P=cfe-${PV/_/}.src
DESCRIPTION="Common files shared between multiple slots of clang"
HOMEPAGE="https://llvm.org/"
SRC_URI="https://github.com/llvm/llvm-project/releases/download/llvmorg-${PV}/${MY_P}.tar.xz"

LICENSE="UoI-NCSA"
SLOT="0"
KEYWORDS="*"
IUSE=""

PDEPEND="sys-devel/clang:*"

S=${WORKDIR}/${MY_P}

src_unpack() {
	einfo "Unpacking parts of ${MY_P}.tar.xz ..."
	tar -xJf "${DISTDIR}/${MY_P}.tar.xz" "${MY_P}/utils/bash-autocomplete.sh" || die
}

src_configure() { :; }
src_compile() { :; }
src_test() { :; }

src_install() {
	newbashcomp utils/bash-autocomplete.sh clang
}
